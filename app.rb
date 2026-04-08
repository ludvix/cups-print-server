require 'sinatra'
include FileUtils::Verbose

get '/' do
  "<h1>Print Server</h1>"
end

get '/upload' do 
  erb :upload 
end

__END__

@@upload
<form action='/upload' enctype="multipart/form-data" method='POST'>     
  <input name="file" type="file" />     
  <input type="submit" value="Upload" /> 
</form>