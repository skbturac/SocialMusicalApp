



<div class="ui feed">
  <div class="event">
  </div>
  <div class="event">
    <div class="label">
      <%= image_tag "girlb.png" %>
    </div>
    <div class="content">
      <% @current_user.posts.each do |p| %>
      <div class="summary">
        <a><%= @current_user.name %></a> share about
        <%= p.title %>
      </div>
      <div class="extra text">
        <%= p.content %>
      </div>
      <% p.comments.each do |comment| %>
      <div class="ui comments">
        <h3 class="ui dividing header">Comments</h3>
        <div class="comment">
          <a class="avatar">
          </a>
          <div class="content">
            <a class="author">(user)</a>
            <div class="metadata">

            </div>
            <div class="text">
              <%= comment.text %>
            </div>
            <div class="actions">
              <a class="reply">Reply</a>
              <br>
              <br>
            </div>
          </div>
        </div>
      <% end %>
      <% end %>
    </div>
  </div>
</div>
</div>



<% @current_user.posts.each do |p| %>
<%= @current_user.name %>
<%= p.title %>
<%= p.content %>
<% p.comments.each do |comment| %>
<%= comment.text %>
<% end %>
<% end %>
<p><%= link_to image_tag("music.png", alt: "music", id: "post-image"), new_post_path %></p>
<p>Click to Post Your Music</p>
<p> <%= link_to "Edit Profile", edit_user_path(@current_user) %> </p>
<p> <%= link_to "Delete My Profile", @current_user, method: :delete, data: {confirm: "Really?"} %> </p>
