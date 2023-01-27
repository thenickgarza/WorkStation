class CommentsController < ApplicationController

    before_action :set_user

    def index
       
        @comment = Comment.all
    
    end

    def new

        @comment = Comment.new
    
    end

    def create

        @comment = current_user.comments.new(comment_params)
            respond_to do |format|
                if @comment.save
                    format.html { redirect_to root_path, notice: "Comment was successfully created. "}
                    format.json { render :show, status: :created, location: @comment }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render @comment.errors, status: :unprocessable_entity }
                end
            end
     end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
      end 

    def update

    end

    def destroy

    end

    private 



    def comment_params
        
        params.require(:comment).permit(:title, :content, :user_id)
    
    end

end
