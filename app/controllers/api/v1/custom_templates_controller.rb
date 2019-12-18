# frozen_string_literal: true

class Api::V1::CustomTemplatesController < Api::BaseController
  respond_to :json

  skip_before_action :set_cache_headers

  def index
    expires_in 3.minutes, public: true
    render_with_cache(each_serializer: REST::CustomTemplateSerializer) { CustomTemplate.where(disabled: false) }
  end
end
