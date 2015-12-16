module ArtistsHelper
	def artist_has_profile?(user = current_user)
		return false unless user.present?
		Artist.where(user_id: user.try(:id) || user).exists?
	end
end
