module CommentsHelper
	def comments(messages)
		unless messages.empty?
		  messages.map do |message, sub_messages|
			 content_tag(:div, render(message) + content_tag(:div, comments(sub_messages), :class => "replies"), :class => "comment_group")
		  end.join.html_safe
		else
			#return '<h3>No comments!</h3>'.html_safe
		end
	end
end