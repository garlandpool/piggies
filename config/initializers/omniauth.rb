OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '1230312190335458', '053dac31f076582ce0caeb12a5240b76'
end