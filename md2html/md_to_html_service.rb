# app.rb

# ruby app.rb -s puma


require 'sinatra'
require 'redcarpet'

set :port, 4567

get '/' do
  file_path = 'python_tutorial.md'
  markdown_text = read_file_content(file_path)

  if markdown_text
    html = convert_to_html(markdown_text)
    erb :result, locals: { html: html }
  else
    erb :index, locals: { error: "File not found or invalid." }
  end
end

def read_file_content(file_path)
  File.read(file_path) if File.exist?(file_path)
end


def convert_to_html(markdown_text)
  renderer = Redcarpet::Render::HTML.new(hard_wrap: true, fenced_code_blocks: true)
  markdown = Redcarpet::Markdown.new(renderer)
  markdown.render(markdown_text)
end

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
  <title>Markdown Viewer</title>
</head>
<body>
  <%= yield %>
</body>
</html>

@@ index
<div>
  <h2>Markdown Viewer</h2>
  <% if error %>
    <p style="color: red;"><%= error %></p>
  <% end %>
  <p>This is the content of the "document.md" file:</p>
  <%= markdown_text %>
</div>

@@ result
<div>
  <h2>Markdown Viewer</h2>
  <div><%= html %></div>
</div>
