class MainController < ApplicationController
  def index
    @school = School.find(1)
  end

  def each_univ
    @university = "北海道科学大学"
    @department = "工学部"
    @major = "電気電子工学科"
    @contents = Content.where(university: @university, department: @department, major: @major)
  end

  def upload
    @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file) )
    @upload_file.save
    redirect_to action: 'index'
    content_hash = {
        university:"garu",
        department:"yuih",
        major:"team",
        lesson:"lab",
        year:2,
        download:@upload_file.file.current_path
    }
    Content.create(content_hash)
  end

  def download
    @upload_file = UploadFile.find(params[:id].to_i)
    filepath = @upload_file.file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @upload_file.file.url.gsub(/.*\//,''), :length => stat.size)
  end

end
