class ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])

    respond_to do |format|
    	format.html
    	format.pdf do
    		pdf = ReportPdf.new(@report)
    		send_data pdf.render,
    				  filename: "#{ @report.partner }_report_#{ @report.id }",
    				  type: 'application/pdf',
    				  disposition: 'inline'
    	end
    end
  end

end
