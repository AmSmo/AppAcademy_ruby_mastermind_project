require_relative "code"

class Mastermind

    def initialize(length)

        @secret_code = Code.random(length)

    end

    def print_matches(guess)
        puts "Exact matches: #{@secret_code.num_exact_matches(guess)}"
        puts "Near matches : #{@secret_code.num_near_matches(guess)}"

    end


    def ask_user_for_guess
        puts "Enter a code"
        user_guess = gets.chomp
        attempt = Code.from_string(user_guess)
        print_matches(attempt)
        if attempt == @secret_code
            return true

        else
            return false
        end


    end
end
