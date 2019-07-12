class Profile < ApplicationRecord
    belongs_to :user
    

    def num_lists
        List.count
    end

    def avg_tasks
       Task.count / List.count
    end
end
