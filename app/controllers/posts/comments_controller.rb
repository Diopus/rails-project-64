class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ new create ]
  #before_action :set_post_comment, only: %i[ show edit update destroy ]

  # GET /post_comments/new
  def new
    # @post_comment = @post.comments.build
  end

  # POST /post_comments or /post_comments.json
  def create
    post_comment = @post.comments.build(post_comment_params)
    post_comment.creator = current_user

    respond_to do |format|
      if post_comment.save
        format.html { redirect_to post_path(@post), notice: I18n.t('posts.comments.create.success') }
        format.json { render :show, status: :created, location: post_comment }
      else
        #format.html { render :new, status: :unprocessable_entity }
        format.json { render json: post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
end
