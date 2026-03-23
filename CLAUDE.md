# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **SPEAK**, a Ruby on Rails 7 language learning application. It provides structured English learning content through units, sections, phrases, and interactive activities.

## Technology Stack

- **Ruby**: 3.2.2
- **Rails**: 7.0.1
- **Database**: MySQL (configured via socket connection)
- **Authentication**: Devise with custom OTP (TOTP) support via ROTP gem
- **Asset Pipeline**: Sprockets with jsbundling-rails
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Testing**: Minitest with Capybara for system tests

## Development Commands

```bash
# Install dependencies
bundle install

# Database setup
rails db:create db:migrate db:seed

# Run the development server
rails server
# or
bin/rails server

# Run tests
rails test

# Run a single test file
rails test test/controllers/units_controller_test.rb

# Run a specific test by line number
rails test test/models/user_test.rb:10

# Console
rails console
# or
bin/rails console

# Database console
rails dbconsole
```

## Architecture

### Content Hierarchy

The learning content follows a nested structure:

```
Unit (e.g., "Unit 1 - Introducing Yourself")
  └── Section (ordered by position)
        ├── Phrases (dialogue lines with speaker attribution)
        └── Activities (interactive exercises)
              └── ActivityItems (individual questions/prompts)
```

### Section Types

Sections use Single Table Inheritance via `section_type` field. Each type has a dedicated view template at `app/views/sections/types/`:

- `warm_up` - Discussion prompts
- `listen_repeat` - Audio phrases for repetition
- `language_work` - Grammar exercises with contracted forms, word stress
- `dialogue` - Conversation practice with context
- `fill_blank` - Cloze exercises (template exists but empty)

The `SectionsController#show` dynamically renders the appropriate template based on section type:
```ruby
render "sections/types/#{@section.section_type}"
```

### Authentication Flow

Custom Devise implementation in `Users::SessionsController`:
1. Standard email/password login
2. Optional OTP flow via `send_otp` action using ROTP/TOTP
3. OTPs are emailed via `UserMailer` and valid for 5 minutes (300s drift)

### Audio Handling

Phrases support audio attachments via Active Storage. Audio is streamed via `PhrasesController#audio` using `redirect_to` to the blob URL with `disposition: 'inline'`.

### User Progress Tracking

The `UserProgress` model uses a polymorphic `trackable` association to record completion of sections, activities, etc. It stores `completed_at` timestamps and scores.

## Database Configuration

MySQL connection uses socket by default (`/var/run/mysqld/mysqld.sock`). Credentials in `config/database.yml`:
- Development: `root` / `password`
- Database names: `ap` (dev), `ap_test` (test), `ap_production` (prod)

## Key File Locations

- **Routes**: `config/routes.rb` - Nested resources for units/sections/phrases/activities
- **Seeds**: `db/seeds.rb` - Contains Unit 1 sample data with all section types
- **Custom Devise**: `app/controllers/users/sessions_controller.rb`
- **Styles**: `app/assets/stylesheets/application.css` - Single file, no preprocessor
- **Section Views**: `app/views/sections/types/*.html.erb`

## Testing

Uses Rails default Minitest (not RSpec). Fixtures are defined in `test/fixtures/`. System tests use Selenium WebDriver.

## Notes

- No JavaScript build system detected (uses Sprockets + jsbundling-rails)
- No Docker or Procfile configuration present
- Application name module is `Ap` (from `config/application.rb`)
- `expenses_controller.rb` exists but appears to be legacy/unused code
