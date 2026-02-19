
export enum Screen {
  LOGIN = 'LOGIN',
  REGISTER = 'REGISTER',
  DASHBOARD = 'DASHBOARD',
  SEARCH_DOCTORS = 'SEARCH_DOCTORS',
  SCHEDULE_APPOINTMENT = 'SCHEDULE_APPOINTMENT',
  APPOINTMENTS = 'APPOINTMENTS',
  MEDICAL_HISTORY = 'MEDICAL_HISTORY',
  REMINDERS = 'REMINDERS'
}

export interface Doctor {
  id: number;
  name: string;
  specialty: string;
  availability: string;
}

export interface Appointment {
  id: number;
  doctorName: string;
  date: string;
  time: string;
  status: 'upcoming' | 'completed';
  diagnosis?: string;
  notes?: string;
}
