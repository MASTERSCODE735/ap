class ExpensesController < ApplicationController
  def index
    # Dummy data for landing page
    @expenses = [
      { title: 'Travel', amount: 1200, date: '2025-08-01' },
      { title: 'Meals', amount: 450, date: '2025-08-05' },
      { title: 'Stationery', amount: 200, date: '2025-08-10' }
    ]
    @reports = [
      { name: 'Monthly Report', status: 'Completed' },
      { name: 'Policy Compliance', status: 'Pending' }
    ]
  end
end
