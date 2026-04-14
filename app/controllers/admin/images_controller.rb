class Admin::ImagesController < Admin::BaseController
  skip_before_action :verify_authenticity_token

  def update
    block = ContentBlock.find_or_initialize_by(key: params[:id])
    block.image.attach(params[:image])
    block.save!
    render json: { url: url_for(block.image) }
  end
end
