class CreateAdminService
  def call
    User.first_or_initialize(
      email: Rails.application.secrets.admin_email
    ).tap do |user|
      user.password = Rails.application.secrets.admin_password
      user.password_confirmation = Rails.application.secrets.admin_password
      user.admin!
    end
  end
end
