# Copyright Erisa Komuro (Seriel), spotlight_is_ok, Larsenv 2017
module YuukiBot
  module Extra
    text_joke_commands = %w(doit pun wisdom lawyerjoke)
    text_joke_commands.each { |x|
      $cbot.add_command(x.to_sym,
          code: proc { |event|
            result = File.readlines("text/Jokes/#{x}.txt").sample.chomp
            event.respond("*#{result}*")
          }
        )
      }

    text_other_commands = %w(vote topicchange fortunes factdiscord randomssmash4item)
    text_other_commands.each { |x|
      $cbot.add_command(x.to_sym,
          code: proc { |event|
            result = File.readlines("text/Other/Text/#{x}.txt").sample.chomp
            event.respond("*#{result}*")
          },
        )
      }

    $cbot.add_command(:confucius,
        code: proc { |event, _|
          event.respond("Confucious say #{File.readlines('text/Jokes/confucious.txt').sample.chomp}")
        }
    )
	
	$cbot.add_command(:dance,
        code: proc { |event, _|
		  letters = YAML.load_file('config/dancingletters.yml')
          event.respond(args.join(/ /).downcase.gsub(/[a-zA-Z.0-9 ?!&$-]/, letters).to_s )
        }
    )

    $cbot.add_command(:notice,
        code: proc { |event, args|
          if args[0] == 'me'
            whom = event.user.name
          else
            whom = args[0]
          end
          
          if args.length >= 2 && args[1] == 'senpai'
            event.respond("*Senpai notices #{whom}*")
          else
            event.respond("*notices #{whom}*")
          end
        },
        min_args: 1
    )
  end
end
