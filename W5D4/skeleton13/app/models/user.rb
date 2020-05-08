class User < ApplicationRecord

    has_many(:enrollments,
    {   primary_key: :id,
        foreign_key: :enrollment_id,
        class_name: :Enrollment
    })

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
end
