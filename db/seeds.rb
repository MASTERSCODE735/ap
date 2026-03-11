# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding Unit 1..."

unit = Unit.create!(
  title: "Unit 1 - Introducing Yourself",
  description: "Learn how to get to know others and introduce yourself to others.",
  position: 1
)

# ── I. WARM UP ───────────────────────────────────────────
warm_up = unit.sections.create!(
  section_type: "warm_up",
  title: "Warm Up - Discussion",
  instructions: "Think about these questions and discuss with your partner.",
  position: 1
)

warm_up.phrases.create!([
  { text: "What questions do you usually ask when you want to get to know others?", position: 1 },
  { text: "What questions must you avoid asking?", position: 2 }
])

# ── II. LISTEN & REPEAT ──────────────────────────────────
listen_repeat = unit.sections.create!(
  section_type: "listen_repeat",
  title: "Listen & Repeat",
  instructions: "Listen and repeat after the tape / your tutor.",
  position: 2
)

listen_repeat.phrases.create!([
  # Dialogue 1
  { speaker: "A", text: "May I introduce myself? I'm Ravi.", position: 1 },
  { speaker: "B", text: "How do you do? My name is Ali.", position: 2 },
  # Dialogue 2
  { speaker: "A", text: "Excuse me. I don't think we've met. My name is Shivram. I work for Voltas.", position: 3 },
  { speaker: "B", text: "How do you do Mr Shivram? I'm Raman. I'm a businessman.", position: 4 },
  # Dialogue 3
  { speaker: "A", text: "Hello, I'm Ahmed. I'm a student at Ramaiah Engineering College.", position: 5 },
  { speaker: "B", text: "I'm glad to meet you. I'm Ramesh. I'm studying at National College.", position: 6 }
])

# ── III. LANGUAGE WORK ───────────────────────────────────
lang_section = unit.sections.create!(
  section_type: "language_work",
  title: "Language Work",
  instructions: "Study the expressions used in this unit.",
  position: 3
)

# Expressions as phrases (no audio needed)
lang_section.phrases.create!([
  { speaker: "You",   text: "Hello, I'm [your name].", position: 1 },
  { speaker: "You",   text: "May I introduce myself? I'm [your name].", position: 2 },
  { speaker: "You",   text: "I don't think we've met. My name is [name] and I work for [company].", position: 3 },
  { speaker: "Other", text: "How do you do?", position: 4 },
  { speaker: "Other", text: "Nice to meet you.", position: 5 },
  { speaker: "Other", text: "I'm glad to meet you. My name is [name].", position: 6 }
])

# Contracted Forms Activity
contracted = lang_section.activities.create!(
  activity_type: "contracted_forms",
  title: "Contracted Forms",
  instructions: "In spoken English we use contracted forms. Match the full form to its contracted form.",
  position: 1
)

contracted.activity_items.create!([
  { prompt: "I am",    answer: "I'm",   position: 1 },
  { prompt: "do not",  answer: "don't", position: 2 },
  { prompt: "we have", answer: "we've", position: 3 },
  { prompt: "let us",  answer: "let's", position: 4 }
])

# Word Stress Activity
word_stress = lang_section.activities.create!(
  activity_type: "word_stress",
  title: "Word Stress",
  instructions: "Say the following words. Give prominence to the syllables in capitals.",
  position: 2
)

word_stress.activity_items.create!([
  { prompt: "introDUCE",    answer: "introduce",    position: 1 },
  { prompt: "exCUSE",       answer: "excuse",       position: 2 },
  { prompt: "MySELF",       answer: "myself",       position: 3 },
  { prompt: "COLlege",      answer: "college",      position: 4 },
  { prompt: "BUSiness man", answer: "businessman",  position: 5 },
  { prompt: "engiNEERing",  answer: "engineering",  position: 6 }
])

# ── V. DIALOGUE PRACTICE ─────────────────────────────────
dialogue = unit.sections.create!(
  section_type: "dialogue",
  title: "Dialogue Practice",
  instructions: "Read the dialogue silently. Then listen and repeat. Then practise in pairs.",
  context: "Babu Balram is a software engineer visiting Mumbai. A television reporter interviews him.",
  position: 4
)

dialogue.phrases.create!([
  { speaker: "Reporter", text: "Hello, what's your name?", position: 1 },
  { speaker: "Babu",     text: "I am Babu Balram.", position: 2 },
  { speaker: "Reporter", text: "Where do you come from?", position: 3 },
  { speaker: "Babu",     text: "I come from Karwar - that's in North Karnataka, on the coast.", position: 4 },
  { speaker: "Reporter", text: "Were you born there?", position: 5 },
  { speaker: "Babu",     text: "Yes, I was; but I was brought up in Bangalore.", position: 6 },
  { speaker: "Reporter", text: "What do you do Mr Balram?", position: 7 },
  { speaker: "Babu",     text: "I am a software engineer. I work for an international firm in Bangalore.", position: 8 },
  { speaker: "Reporter", text: "Have you been to Mumbai before?", position: 9 },
  { speaker: "Babu",     text: "No, I haven't, but... I've been to Pune.", position: 10 },
  { speaker: "Reporter", text: "Are you visiting other places in Maharashtra?", position: 11 },
  { speaker: "Babu",     text: "We might go to Khandala for a weekend visit.", position: 12 },
  { speaker: "Reporter", text: "Have a nice weekend, Mr Balram.", position: 13 },
  { speaker: "Babu",     text: "Thanks a lot.", position: 14 }
])

puts "Done! Created Unit 1 with #{Section.count} sections, #{Phrase.count} phrases, #{ActivityItem.count} activity items."