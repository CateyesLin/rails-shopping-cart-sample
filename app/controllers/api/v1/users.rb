module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        # POST /api/v1/users/sign_in
        # Role: anonymous
        # 登入
        desc "Sign in"
        params do
          requires :email, type: String, regexp: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, desc: "User email"
          requires :password, type: String, desc: "User password"
        end
        post :sign_in do
          email = params[:email]
          password = params[:password]

          error!('400 email and password missing.', 400) if email.nil? || password.nil?

          user = User.find_by(email: email.downcase)

          error!('404 email not found.', 404) if user.nil?
          error!('403 password not match.', 403) if !user.valid_password?(password)

          user.ensure_access_token
          user.save
          status(201)
          envelope(user.as_sign_in_json)
        end
      end
    end
  end
end
