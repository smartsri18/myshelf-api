module HasJwt
  extend ActiveSupport::Concern

  included do
    def token
      Auth.encode(token_payload)
    end
  end
end