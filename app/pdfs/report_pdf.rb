class ReportPdf < Prawn::Document
  def initialize(report)
    super(top_margin: 25, bottom_margin: 25)
    @report = report
    report_content
  end

  def report_content
    10.times do
        start_new_page
    end

    repeat([1]) do

        # header
        bounding_box [bounds.left, bounds.top], :width  => bounds.width do
            stroke_bounds
            font "Helvetica"

            text "<b>Customer Name:</b>  #{ customer_name(@report) }", 
                 align: :right,
                 size: 10,
                 inline_format: true,
                 position: :right
            text "<b>Test ID:</b>  #{ test_id(@report) }", 
                 align: :right,
                 size: 10,
                 inline_format: true,
                 position: :right
            image "#{Rails.root}/app/assets/images/logo.png", width: 150, position: :left
            
            stroke_horizontal_rule
        end

      text "Page 1"
    end

    repeat(2..self.page_count) do
        move_down 50

        # header
        bounding_box [bounds.left, bounds.top], :width  => bounds.width do
            font "Helvetica"
            text "<b>Customer Name:</b>  #{ customer_name(@report) }", 
                 align: :right,
                 size: 10,
                 inline_format: true
            text "<b>Test ID:</b>  #{ test_id(@report) }", 
                 align: :right,
                 size: 10,
                 inline_format: true
            stroke_horizontal_rule
        end

        # footer
        bounding_box [bounds.left, bounds.bottom + 50], :width  => bounds.width do
            font "Helvetica"
            stroke_horizontal_rule
            move_down(5)
            text "<b>Clinsyte reports do not provide medical advice, diagnosis, or treatment. " \
                 "The report is for informational purposes only, and should not be interpreted" \
                 " as specific professional medical advice. Please consult with a doctor or qu" \
                 "alified healthcare professional before making decisions about medical condit" \
                 "ions, or before starting and stopping any treatment, diet or exercise progra" \
                 "m.</b>",
                 size: 7,
                 inline_format: true
            move_down 13
            text "</i>© Copyright Scriptyx, 2015. United States Patent Pending. Joint Venture Group, LLC. All rights reserved.</i>",
                 size: 7,
                 inline_format: true
        end
      end

      string = "pg. <page> of <total>"
      options = { :at => [bounds.right - 150, 0],
       :width => 150,
       :align => :right,
       :page_filter => (1..11),
       :start_count_at => 1,
       :size => 7
      }

      number_pages string, options      
  end


  private

  def customer_name(report)
    "Simpson, Homer"
  end

  def test_id(report)
    "RPT19-02032"
  end

end