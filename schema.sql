CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(255),
    date_of_birth DATE,
    student_address VARCHAR(255),
    grade_level INT,
    guardian_name VARCHAR(255),
    guardian_contact VARCHAR(20),
    emergency_contact VARCHAR(20),
    enrollment_date DATE,
    graduation_date DATE,
    total_subjects INT,
    average_grade NUMERIC(5, 2),
    attendance_percentage NUMERIC(5, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create trigger function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to update updated_at timestamp on update
CREATE TRIGGER student_update_updated_at
BEFORE UPDATE ON student
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();
