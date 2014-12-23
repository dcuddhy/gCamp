class PagesController <ApplicationController

  layout :determine_layout
  skip_before_action :ensure_current_user
  

  def index

    quote1 = Quote.new
    quote1.text = "Failure is not an option. Everyone has to succeed"
    quote1.author = 'Arnold Schartzenegger'

    quote2 = Quote.new
    quote2.text = "Your time is limited, so don\'t waste it living someone else\'s life."
    quote2.author = 'Steve Jobs'

    quote3 = Quote.new
    quote3.text = "Better Ingredients, Better Pizza"
    quote3.author = 'Papa John'


  @quotes = [quote1, quote2, quote3]

  end




  def faq

    faq1 = Faq.new
    faq1.question = "What is gCamp?"
    faq1.answer = "gCamp is an awesome tool that is going to change
                  your life. gCamp is your one stop shop to organize
                  all your tasks and documents.  You'll also be able
                  to track comments that you and others make.  gCamp
                  may Userually replace all need for paper and pens
                  in the entire world.  Well, maybe not, but it's
                  going to be pretty cool."

    faq2 = Faq.new
    faq2.question = "How do I join gCamp?"
    faq2.answer = "Right now, gCamp is still in production.  So, there
                  is not a sign up page open to the public yet!  Your
                  best option is to become super best friends with a
                  gCamp developer.  They can be found in the hanging
                  around gSchool during the day and hitting the hottest
                  clubs at night."

    faq3 = Faq.new
    faq3.question = "When will gCamp be finished?"
    faq3.answer = "gCamp is a work in progress.  That being said, it
                  should be fully functional by December 2014.
                  Functional, but our developers are going to continue
                  improve the site for the foreseable future.  Check
                  in daily for new features and awesome functionality.
                  It's going to blow your mind.  Organization is only
                  (well, will only) be a click away.  Amazing!"

  @faqs = [faq1, faq2, faq3]

  end

end
