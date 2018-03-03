class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
    	t.string :report_number
    	t.string :partner
    end
  end
end
