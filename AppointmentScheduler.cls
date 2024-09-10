public class AppointmentScheduler {
    // Method to schedule an appointment for a patient
    public static void scheduleAppointment(Id patientId, Id doctorId, Datetime appointmentDateTime) {
        // Create a new appointment record
        Appointment__c appointment = new Appointment__c();
        appointment.Patient__c = patientId;
        appointment.Doctor__c = doctorId;
        appointment.Appointment_Date_Time__c = appointmentDateTime;
        
        // Insert the appointment record into the database
        insert appointment;
        
        System.debug('Appointment scheduled successfully for patient: ' + patientId);
    }
}

// Example usage
Id patientId = '0031k00002zzzzzzz'; // Example Patient ID
Id doctorId = '0031k00002yyyyyyy'; // Example Doctor ID
Datetime appointmentDateTime = Datetime.newInstance(2024, 6, 15, 10, 0, 0); // June 15, 2024, 10:00 AM

AppointmentScheduler.scheduleAppointment(patientId, doctorId, appointmentDateTime);
