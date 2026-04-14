class Admin::ContentBlocksController < Admin::BaseController
  skip_before_action :verify_authenticity_token

  def update
    block = ContentBlock.find_or_initialize_by(key: params[:id])
    block.value = params[:value]
    block.save!
    render json: { ok: true }
  end
end
