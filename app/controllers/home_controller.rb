class HomeController < ApplicationController
  def index
  end

  def submit_form
  redirect_to home_show_path(name: params[:name], age: params[:age], breed: params[:breed], weight: params[:weight], activity: params[:activity], format: :pdf)
  end

  def fetch_dog_facts
    response = HTTParty.get('http://dog-api.kinduff.com/api/facts?raw=true')
    render plain: response.body
  end
  def show
    @name= params[:name]
    @age= params[:age]
    @breed= params[:breed]
    @weight= params[:weight]
    @activity= params[:activity]
    @human_age = (16 * Math.log(@age.to_f) + 31).round
   #  @image = RandomDog.get_random_image
    dogfood = DogFood.new
    @dogcups = dogfood.query(@activity, @weight)
    doginfo = DogInfo.new
    @dognutrition = doginfo.query(@breed)
    # @chatgptout = ChatgptService.call('Causes, symptoms and remedies for rabies 3 points each. Mention only values of Percentages of commonness of rabies in dogs, percentage in golden retrievers and severity on scale of 5')

   # @chatgptout_causes = ChatgptService.call('Causes of rabies in 40 words numbered')




    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Pet Medical Report', # file name
               template: 'home/pet_report1.html.erb',
               layout: 'layouts/pdf.html.erb', # optional, use 'pdf.html' for a simple layout
               disposition: 'inline',
              margin: { top: 0, bottom: 0, left: 0, right: 0 } # 'attachment' to download, 'inline' to display in the browser
      end
    end
  end
end
