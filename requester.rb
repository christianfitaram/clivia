require "htmlentities"
require "json"
module Requester
  def select_main_menu_action
    # prompt the user for the "random | scores | exit" actions
    puts "random | scores | exit"
  end

  def ask_question(question)
    # CONFIGURAR PUNTAJE INICIAL EN O
    @puntaje = 0
    # ITERAR PREGUNTAS
    question.each do |datos|
      respuestas_num = 0
      puts "\nCategory : #{datos[:category]} | Difficulty : #{datos[:difficulty]}"
      question_raw = datos[:question]
      question_decode = HTMLEntities.new.decode(question_raw)
      puts "Question: #{question_decode} "

      respuesta_co = datos[:correct_answer]
      respuesta_in = datos[:incorrect_answers]
      big_array = respuesta_in.push(respuesta_co)
      bigarray_size = big_array.shuffle

      bigarray_size.each do |opc|
        puts "#{respuestas_num += 1}. #{HTMLEntities.new.decode(opc)}"
      end
      print "> "
      print respuesta_usuario = gets.chomp
      real_respueta = respuesta_usuario.to_i - 1
      while respuesta_usuario.empty?
        puts "\nType a number"
        print "> "
        print respuesta_usuario = gets.chomp
      end
      until respuesta_usuario.match?(/^[0-4]$/)
        puts "\nType a number"
        print "> "
        print respuesta_usuario = gets.chomp
      end
      if bigarray_size[real_respueta] == respuesta_co
        puts "\nCorrect! ... +10"
        @puntaje += 10
      elsif bigarray_size[real_respueta] != respuesta_co
        puts "\n#{bigarray_size[real_respueta]} ... Incorrect!"
        puts "The correct answer was: #{respuesta_co}"
      end
    end
    will_save?(@puntaje)
    @exit_loop = true
    # show category and difficulty from question
    # show the question
    # show each one of the options
    # grab user input
  end

  def will_save?(_score)
    # show user's score
    # ask the user to save the score
    # grab user input
    # prompt the user to give the score a name if there is no name given, set it as Anonymous
    puts "Well done! Your score is #{@puntaje}"
    puts "--------------------------------------------------"
    puts "Do you want to save your score? (y/n)"
    print "> "
    save_score = gets.chomp
    while save_score.empty?
      puts "Can not send an emtpy response"
      print "> "
      save_score = gets.chomp
    end
    siono = save_score.capitalize
    case siono
    when "Y"
      control_var = true
    when "N"
      control_var = false
    end
    while control_var
      puts "Type the name to assign to the score:"
      print "> "
      name_save_score = gets.chomp
      # SI EL USUARIO DECIDE NO REGISTRAR NOMBRE SE GUARADA COMO ANONYMOUS
      name_save_score = "Anonymous" if name_save_score.empty?
      # GUARDAR LOS DATOS DEL NOMBRE Y PUNTAJE EN ARRAYS SEPARADOS
      @array_name_save_score.push(name_save_score)
      @array_score.push(@puntaje)
      # UNIR ARRAYS PARA ENVIARLO AL ARCHIVO JSON
      pairs = @array_name_save_score.zip(@array_score)
      File.open("scores.json", "w") do |f|
        f.write(pairs.to_json)
        puts "Saved!!"
      end
      control_var = false
    end
  end

  def gets_option(prompt, options); end
end
