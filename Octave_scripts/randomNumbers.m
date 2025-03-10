function nums = randomNumbers(N)
    % Generates N random numbers between -5000 and 5000
    % but excludes numbers between -100 and 100

    if nargin < 1
        N = 1; % Default to 1 number if not specified
    end

    nums = zeros(1, N); % Preallocate array
    for i = 1:N
        while true
            num = randi([-5000, 5000]); % Generate a random number
            if num < -100 || num > 100   % Exclude numbers between -100 and 100
                nums(i) = int16(num);
                break; % Exit loop once a valid number is found
            end
        end
    end
end
