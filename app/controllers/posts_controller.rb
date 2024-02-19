class PostsController < ApplicationController
  def index
    matching_posts = Post.all

    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Post.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    render({ :template => "posts/show" })
  end

  def create
    the_post = Post.new
    the_post.description = params.fetch("query_description")
    the_post.arrive_on = params.fetch("query_arrive_on")
    the_post.detail = params.fetch("query_detail")
    the_post.user_id = params.fetch("query_user_id")
    the_post.arrived = params.fetch("query_arrived")

    if the_post.valid?
      the_post.save
      redirect_to("/posts", { :notice => "Added to list." })
    else
      redirect_to("/posts", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.description = params.fetch("query_description")
    the_post.arrive_on = params.fetch("query_arrive_on")
    the_post.detail = params.fetch("query_detail")
    the_post.arrived = params.fetch("query_arrived")

    if the_post.valid?
      the_post.save
      redirect_to("/posts/#{the_post.id}", { :notice => "Marked as received."} )
    else
      redirect_to("/posts/#{the_post.id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy

    redirect_to("/posts", { :notice => "Deleted."} )
  end
end
