<%= form_for @comment do |f| %>
  Post Title: <%= f.collection_select :post_id, Post.all, :id, :title %><br>
    <br>
  Enter Your Comment:<br>
  <%= f.text_area :text, placeholder: "Compose new comment..." %><br>
    <br>
  User:<br>
  <%= f.collection_select :user_id, User.all, :id, :name %>
    <br>
    <br>
  <%= f.submit "Post", class: "btn btn-primary" %>
<% end %>
