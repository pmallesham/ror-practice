class HomeController < ApplicationController
  layout 'application2'
  def index

  end

  def show_pdf
    respond_to do |format|
      format.html
      format.pdf{render pdf: "abc"}
    end
  end

  def generate_qrcode
    @qr = RQRCode::QRCode.new( 'http://www.codecpm.in', :size => 3, :level => :m)
  end

  def generate_barcode
    layout 'application2'

    barcode = Barby::Code39.new('BARBY')

    blob = Barby::PngOutputter.new(barcode).to_png #Raw PNG data
    File.open("public/barcode.png", 'wb'){|f| f.write blob }
    #Convenience method
    File.open("public/barcode2.png", 'wb'){|f| f.write barcode.to_png }
  end

end
