class Timer
    attr_reader :time

    def initialize(time)
        @time = time
    end

    def count_down()
        # create thread so timer can run in parallel with game.
        Thread.new do
            while (@time >= 0) do
                print "\rTime Remaining: #{@time}"
                sleep(1)
                @time -= 1
            end
        end
    end
end