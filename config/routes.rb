Rails.application.routes.draw do
  get 'main/index'
  get 'main/each_univ'
  get 'main/form'
  get 'main/download'
  get 'main/create'
  get 'main/new'
  post 'main/upload'
  post '/main/upload'

  # get 'uploader/download/:id', to:  '/public/uploads/upload_file/file/3/330A33006-0.pdf'
end
