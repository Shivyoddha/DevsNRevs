class HomeController < ApplicationController
  def index
  end

  def submit_form
  redirect_to home_show_path(name: params[:name], age: params[:age], breed: params[:breed], weight: params[:weight], activity: params[:activity], format: :pdf)
  end

  def show
    @name= params[:name]
    @age= params[:age]
    @breed= params[:breed]
    @weight= params[:weight]
    @activity= params[:activity]
    @image = RandomDog.get_random_image
    dogfood = DogFood.new
    @dogcups = dogfood.query(@activity, @weight)
    hugging_face_service = HuggingFaceService.new

  first_response = hugging_face_service.query({ "inputs" => "Symptoms of rabies is " })
  @symptom1 = first_response
  sleep(4)
  second_response = hugging_face_service.query({ "inputs" => "Causes of rabies are " })
  @cause1 = second_response
  sleep(4)
  third_response = hugging_face_service.query({ "inputs" => "Most prominent remedy of rabies is " })
  @remedy1 = third_response
  sleep(4)
  first_response = hugging_face_service.query({ "inputs" => "Symptoms of Alzhimer is " })
  @symptom2 = first_response
  sleep(4)
  second_response = hugging_face_service.query({ "inputs" => "Causes of Alzhimer are " })
  @cause2 = second_response
  sleep(4)
  third_response = hugging_face_service.query({ "inputs" => "Most prominent remedy of Alzhimer is " })
  @remedy2 = third_response
  sleep(4)
  first_response = hugging_face_service.query({ "inputs" => "Symptoms of Lupus is " })
  @symptom3 = first_response
  sleep(4)
  second_response = hugging_face_service.query({ "inputs" => "Causes of Lupus are " })
  @cause3 = second_response
  sleep(4)
  third_response = hugging_face_service.query({ "inputs" => "Most prominent remedy of Lupus is " })
  @remedy3 = third_response


    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Pet Medical Report', # file name
               template: 'home/pet_report.html.erb',
               layout: 'layouts/pdf.html.erb', # optional, use 'pdf.html' for a simple layout
               disposition: 'inline',
              margin: { top: 0, bottom: 0, left: 0, right: 0 } # 'attachment' to download, 'inline' to display in the browser
      end
    end
  end
end
