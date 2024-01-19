# do not forget to require your gem dependencies
require "httparty"
require "json"
require "terminal-table"
# do not forget to require_relative your local dependencies
require_relative "presenter"
require_relative "requester"

class CliviaGenerator
  include Presenter
  include Requester
  # maybe we need to include a couple of modules?

  def initialize
    # we need to initialize a couple of properties here
    @exit_loop = true
    @array_name_save_score = []
    @array_score = []
    @count = 0
  end

  def start
    # prompt the user for an action
    # keep going until the user types exit
    while @exit_loop
      print_welcome
      select_main_menu_action
      print "> "
      action = gets.chomp

      case action
      when "random" then random_trivia
      when "scores" then print_scores
      when "exit" then @exit_loop = false
      else
        puts "Invalid option"
      end
    end
  end

  def random_trivia
    # load the questions from the api
    url = "https://opentdb.com/api.php?amount=10"
    response = HTTParty.get(url)
    respuesta = JSON.parse(response.body, symbolize_names: true)
    resultados = respuesta[:results]
    ask_question(resultados)
    # questions are loaded, then let's ask them
  end

  def ask_questions
    # ask each question
    # if response is correct, put a correct message and increase score
    # if response is incorrect, put an incorrect message, and which was the correct answer
    # once the questions end, show user's score and promp to save it
  end

  def save(data)
    # write to file the scores data
  end

  def parse_scores
    # get the scores data from file
    url = "scores.json"
    response = HTTParty.get(url)
    respuesta = JSON.parse(response.body, symbolize_names: true)
  end

  def load_questions
    # ask the api for a random set of questions
    # then parse the questions
  end

  def parse_questions
    # questions came with an unexpected structure, clean them to make it usable for our purposes
  end

  def print_scores
    # ACCEDER AL ARCHIVO JSON Y ASEGURARSE QUE NO ESTÉ VACÍO
    file = File.read("scores.json")
    if file.empty?
      puts "There is no records saved!"
    else
      data_hash = JSON.parse(file)
      # CREAR ARRAY PARA ALMACENAR DATOS DEL ARCHIVO JASON
      array = []
      # ALMACENANDO DATOS DEL JASON EN EL NUEVO ARRAY
      data_hash.each do |d, x|
        array.push([x, d])
      end
      # ARRAY ORDENADO DE FORMA ASCENDENTE
      array_sort = array.sort
      # REVIRTIENDO ARRAY ORDENADO DE FORMA ASCENDENTE
      array_rev = array_sort.reverse
      # VARIABLE CONTADORA
      num = 0
      # TABLE
      table = Terminal::Table.new title: "Top Scores ", headings: ["Name", "Score"] do |t|
        # RECORRER EL ARRAY ORDENADO DE FORMA ASCENDENTE Y MOSTRARLO
        array_rev.each do |d, x|
          t << [x, d]
          num += 1
          # DETENER EL RECORRIDO A LAS 1O ITEREACIONES
          break if num == 10
        end
      end
      puts table
    end
  end
end

trivia = CliviaGenerator.new
trivia.start
