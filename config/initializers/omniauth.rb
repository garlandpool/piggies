OmniAuth.config.logger = Rails.logger

<<<<<<< HEAD
Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '1230312190335458', '053dac31f076582ce0caeb12a5240b76'
end
=======
# if Rails.env.development? 
#   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE 
# end

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '1230312190335458', '053dac31f076582ce0caeb12a5240b76'
end


# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :facebook, '1230312190335458', '053dac31f076582ce0caeb12a5240b76', {:client_options => {:ssl => {:ca_path => "C:/row/certs"}}}
# end
>>>>>>> 9baa6e5d7d159e3efa1ba586880d4d4d3d82564e
