class MainController < ApplicationController
  def index
    @contents = Content.last(10)
    @schools = School.select(:university).distinct
    @departments = School.select(:university, :department).distinct
    @majors = School.select(:department, :major).distinct
  end

  def each_univ
    @university = params[:univ]
    @department = params[:depa]
    @major = params[:majo]
    @contents = Content.where(university: @university, department: @department, major: @major)
  end

  def upload
    @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file) )
    @upload_file.save
    redirect_to action: 'index'
    content_hash = {
        university: params[:university],
        department:params[:department],
        major: params[:major],
        lesson: params.require(:upload_file).permit(:name)["name"],
        year: params[:year],
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
