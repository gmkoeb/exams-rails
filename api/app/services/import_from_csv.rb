class ImportFromCsv
  require 'csv'
  def import(rows, job)
    rows.shift
    count = 0
    rows.each do |row|
      patient = find_or_create_patient(row)
      doctor = find_or_create_doctor(row)
      new_exam = Exam.create(doctor:, patient:, token: row[11], date: row[12], exam_type: row[13], type_limits: row[14],
                         type_result: row[15])
      count += 1
      job.update(processed_rows: rows.count) if rows.count == count
      next unless count % 100 == 0
      job.update(processed_rows: count)
    end
  end

  private

  def find_or_create_patient(row)
    patient = Patient.find_by(name: row[1])
    return patient unless patient.nil?

    Patient.create(registration_number: row[0], name: row[1],
                   email: row[2], birth_date: row[3], address: row[4],
                   city: row[5], state: row[6])
  end

  def find_or_create_doctor(row)
    doctor = Doctor.find_by(name: row[9])
    return doctor unless doctor.nil?

    Doctor.create(crm: row[7], crm_state: row[8],
                  name: row[9], email: row[10])
  end
end
