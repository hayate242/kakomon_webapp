Rails.application.routes.draw do
  get 'uploader/index'

  get 'uploader/form'

  get 'uploader/download'


  get 'fileuploads/index'

  get 'fileuploads/create'

  get 'fileuploads/new'

  get 'main/index'

  get 'main/each_univ'

  get 'main/form'


  get 'main/download'


  get 'main/create'

  get 'main/new'

  post 'main/upload'

  post '/uploader/upload'

  post '/main/upload'

  # get 'uploader/download/:id', to:  '/public/uploads/upload_file/file/3/330A33006-0.pdf'
end
