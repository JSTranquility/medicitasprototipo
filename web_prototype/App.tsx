
import React, { useState } from 'react';
import { Screen, Doctor, Appointment } from './types';

// Mock Data
const MOCK_DOCTORS: Doctor[] = [
  { id: 1, name: 'Dr. Smith', specialty: 'General Medicine', availability: 'Mon-Fri 08:00 - 12:00' },
  { id: 2, name: 'Dr. Jones', specialty: 'Pediatrics', availability: 'Tue-Thu 14:00 - 18:00' },
  { id: 3, name: 'Dr. Garcia', specialty: 'Cardiology', availability: 'Mon/Wed/Fri 09:00 - 15:00' },
];

const MOCK_APPOINTMENTS: Appointment[] = [
  { id: 1, doctorName: 'Dr. Smith', date: '2023-11-20', time: '10:00 AM', status: 'upcoming' },
];

const MOCK_HISTORY: Appointment[] = [
  { id: 2, doctorName: 'Dr. Garcia', date: '2023-10-05', time: '02:30 PM', status: 'completed', diagnosis: 'Common Cold', notes: 'Rest and hydration recommended.' },
  { id: 3, doctorName: 'Dr. Jones', date: '2023-09-12', time: '09:00 AM', status: 'completed', diagnosis: 'Annual Checkup', notes: 'Patient is in good health.' },
];

const App: React.FC = () => {
  const [currentScreen, setCurrentScreen] = useState<Screen>(Screen.LOGIN);
  const [selectedDoctor, setSelectedDoctor] = useState<Doctor | null>(null);
  const [appointments, setAppointments] = useState<Appointment[]>(MOCK_APPOINTMENTS);

  const navigateTo = (screen: Screen) => setCurrentScreen(screen);

  const handleCancelAppointment = (id: number) => {
    setAppointments(prev => prev.filter(app => app.id !== id));
  };

  const renderScreen = () => {
    switch (currentScreen) {
      case Screen.LOGIN:
        return <LoginScreen onLogin={() => navigateTo(Screen.DASHBOARD)} onRegister={() => navigateTo(Screen.REGISTER)} />;
      case Screen.REGISTER:
        return <RegisterScreen onBack={() => navigateTo(Screen.LOGIN)} onComplete={() => navigateTo(Screen.LOGIN)} />;
      case Screen.DASHBOARD:
        return <DashboardScreen onNavigate={navigateTo} />;
      case Screen.SEARCH_DOCTORS:
        return <SearchDoctorsScreen onBack={() => navigateTo(Screen.DASHBOARD)} onBook={(doc) => { setSelectedDoctor(doc); navigateTo(Screen.SCHEDULE_APPOINTMENT); }} />;
      case Screen.SCHEDULE_APPOINTMENT:
        return <ScheduleAppointmentScreen doctor={selectedDoctor} onBack={() => navigateTo(Screen.SEARCH_DOCTORS)} onConfirm={() => navigateTo(Screen.APPOINTMENTS)} />;
      case Screen.APPOINTMENTS:
        return <AppointmentsScreen appointments={appointments} onBack={() => navigateTo(Screen.DASHBOARD)} onCancel={handleCancelAppointment} />;
      case Screen.MEDICAL_HISTORY:
        return <MedicalHistoryScreen history={MOCK_HISTORY} onBack={() => navigateTo(Screen.DASHBOARD)} />;
      case Screen.REMINDERS:
        return <RemindersScreen onBack={() => navigateTo(Screen.DASHBOARD)} />;
      default:
        return <LoginScreen onLogin={() => navigateTo(Screen.DASHBOARD)} onRegister={() => navigateTo(Screen.REGISTER)} />;
    }
  };

  return (
    <div className="min-h-screen bg-white text-black flex justify-center items-start p-4">
      {/* Mobile Frame Container */}
      <div className="w-full max-w-sm border-4 border-black min-h-[700px] flex flex-col overflow-hidden">
        {/* App Header (Wireframe Style) */}
        <div className="border-b-4 border-black p-4 text-center font-bold text-xl uppercase">
          MediCitas
        </div>
        
        {/* Screen Content */}
        <div className="flex-1 overflow-y-auto p-4">
          {renderScreen()}
        </div>
      </div>
    </div>
  );
};

// --- SCREENS ---

const LoginScreen: React.FC<{ onLogin: () => void; onRegister: () => void }> = ({ onLogin, onRegister }) => (
  <div className="space-y-6">
    <div className="text-center font-bold text-lg mb-8">[ LOG IN ]</div>
    <div className="space-y-4">
      <div className="space-y-1">
        <label className="text-xs">EMAIL</label>
        <input type="text" className="w-full border-2 border-black p-2 outline-none" placeholder="example@email.com" />
      </div>
      <div className="space-y-1">
        <label className="text-xs">PASSWORD</label>
        <input type="password" className="w-full border-2 border-black p-2 outline-none" placeholder="********" />
      </div>
    </div>
    <button onClick={onLogin} className="w-full border-4 border-black p-3 font-bold hover:bg-black hover:text-white transition-colors">
      LOGIN
    </button>
    <div className="text-center pt-4">
      <button onClick={onRegister} className="text-sm border-b-2 border-black">
        REGISTER NEW ACCOUNT
      </button>
    </div>
  </div>
);

const RegisterScreen: React.FC<{ onBack: () => void; onComplete: () => void }> = ({ onBack, onComplete }) => (
  <div className="space-y-4">
    <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1 mb-2">&lt; BACK</button>
    <div className="font-bold text-lg text-center">[ REGISTRATION ]</div>
    <div className="space-y-2">
      <div className="space-y-1">
        <label className="text-xs">FULL NAME</label>
        <input type="text" className="w-full border-2 border-black p-2 text-sm" />
      </div>
      <div className="space-y-1">
        <label className="text-xs">ID NUMBER</label>
        <input type="text" className="w-full border-2 border-black p-2 text-sm" />
      </div>
      <div className="space-y-1">
        <label className="text-xs">PHONE NUMBER</label>
        <input type="text" className="w-full border-2 border-black p-2 text-sm" />
      </div>
      <div className="space-y-1">
        <label className="text-xs">EMAIL</label>
        <input type="email" className="w-full border-2 border-black p-2 text-sm" />
      </div>
      <div className="space-y-1">
        <label className="text-xs">PASSWORD</label>
        <input type="password" className="w-full border-2 border-black p-2 text-sm" />
      </div>
    </div>
    <button onClick={onComplete} className="w-full border-4 border-black p-3 mt-4 font-bold">
      REGISTER
    </button>
  </div>
);

const DashboardScreen: React.FC<{ onNavigate: (s: Screen) => void }> = ({ onNavigate }) => (
  <div className="space-y-6">
    <div className="p-4 border-2 border-black text-center">
      WELCOME, [PATIENT NAME]
    </div>
    <div className="grid grid-cols-1 gap-4">
      <button onClick={() => onNavigate(Screen.SEARCH_DOCTORS)} className="border-4 border-black p-6 font-bold text-left flex justify-between items-center">
        SEARCH DOCTORS <span>-&gt;</span>
      </button>
      <button onClick={() => onNavigate(Screen.APPOINTMENTS)} className="border-4 border-black p-6 font-bold text-left flex justify-between items-center">
        VIEW APPOINTMENTS <span>-&gt;</span>
      </button>
      <button onClick={() => onNavigate(Screen.MEDICAL_HISTORY)} className="border-4 border-black p-6 font-bold text-left flex justify-between items-center">
        MEDICAL HISTORY <span>-&gt;</span>
      </button>
      <button onClick={() => onNavigate(Screen.REMINDERS)} className="border-4 border-black p-4 text-sm font-bold">
        REMINDER SETTINGS
      </button>
    </div>
    <button onClick={() => window.location.reload()} className="w-full border-2 border-black p-2 text-xs mt-10">
      LOGOUT
    </button>
  </div>
);

const SearchDoctorsScreen: React.FC<{ onBack: () => void; onBook: (d: Doctor) => void }> = ({ onBack, onBook }) => {
  const [filter, setFilter] = useState('');
  const filteredDoctors = MOCK_DOCTORS.filter(d => 
    d.name.toLowerCase().includes(filter.toLowerCase()) || 
    d.specialty.toLowerCase().includes(filter.toLowerCase())
  );

  return (
    <div className="space-y-4">
      <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1">&lt; BACK</button>
      <div className="font-bold">FIND A DOCTOR</div>
      <div className="space-y-2">
        <input 
          type="text" 
          placeholder="SEARCH BY NAME OR SPECIALTY..." 
          className="w-full border-2 border-black p-2 text-sm outline-none"
          value={filter}
          onChange={(e) => setFilter(e.target.value)}
        />
        <div className="text-[10px] text-gray-500">FILTER BY SPECIALTY: [ GENERAL ] [ PEDIATRICS ] [ CARDIOLOGY ]</div>
      </div>
      <div className="space-y-4 mt-4">
        {filteredDoctors.map(doc => (
          <div key={doc.id} className="border-2 border-black p-3 space-y-2">
            <div className="font-bold underline">{doc.name}</div>
            <div className="text-xs">{doc.specialty}</div>
            <div className="text-[10px]">AVAILABILITY: {doc.availability}</div>
            <button 
              onClick={() => onBook(doc)}
              className="w-full border-2 border-black p-1 text-xs font-bold hover:bg-black hover:text-white"
            >
              BOOK APPOINTMENT
            </button>
          </div>
        ))}
      </div>
    </div>
  );
};

const ScheduleAppointmentScreen: React.FC<{ doctor: Doctor | null; onBack: () => void; onConfirm: () => void }> = ({ doctor, onBack, onConfirm }) => (
  <div className="space-y-4">
    <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1">&lt; BACK</button>
    <div className="font-bold text-center border-b-2 border-black pb-2">SCHEDULE APPOINTMENT</div>
    <div className="p-2 border-2 border-black bg-gray-50">
      <div className="text-xs uppercase font-bold">DOCTOR:</div>
      <div>{doctor?.name || 'N/A'}</div>
      <div className="text-[10px]">{doctor?.specialty}</div>
    </div>
    
    <div className="space-y-4 pt-4">
      <div className="space-y-1">
        <label className="text-xs font-bold">SELECT DATE</label>
        <div className="border-2 border-black p-2 text-center text-sm">
          [ 2023 - 11 - 20 ]
        </div>
        <div className="grid grid-cols-7 gap-1 text-[8px] text-center border border-black p-1">
          {Array.from({length: 31}).map((_, i) => (
            <div key={i} className={`border border-black p-1 ${i === 19 ? 'bg-black text-white' : ''}`}>{i+1}</div>
          ))}
        </div>
      </div>

      <div className="space-y-1">
        <label className="text-xs font-bold">SELECT TIME</label>
        <div className="grid grid-cols-3 gap-2">
          {['09:00 AM', '10:00 AM', '11:00 AM', '02:00 PM', '03:00 PM', '04:00 PM'].map(time => (
            <button key={time} className={`border border-black p-1 text-[10px] ${time === '10:00 AM' ? 'bg-black text-white' : ''}`}>
              {time}
            </button>
          ))}
        </div>
      </div>

      <button onClick={onConfirm} className="w-full border-4 border-black p-4 font-bold mt-4">
        CONFIRM APPOINTMENT
      </button>
    </div>
  </div>
);

const AppointmentsScreen: React.FC<{ appointments: Appointment[]; onBack: () => void; onCancel: (id: number) => void }> = ({ appointments, onBack, onCancel }) => (
  <div className="space-y-4">
    <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1">&lt; BACK</button>
    <div className="font-bold underline">UPCOMING APPOINTMENTS</div>
    <div className="space-y-4">
      {appointments.length === 0 ? (
        <div className="text-sm border border-black p-4 text-center">NO APPOINTMENTS FOUND</div>
      ) : (
        appointments.map(app => (
          <div key={app.id} className="border-2 border-black p-3 space-y-1 relative">
            <div className="font-bold">{app.doctorName}</div>
            <div className="text-xs">DATE: {app.date}</div>
            <div className="text-xs">TIME: {app.time}</div>
            <button 
              onClick={() => onCancel(app.id)}
              className="text-[10px] text-red-600 font-bold border border-black px-2 py-1 mt-2 inline-block"
            >
              CANCEL APPOINTMENT
            </button>
          </div>
        ))
      )}
    </div>
  </div>
);

const MedicalHistoryScreen: React.FC<{ history: Appointment[]; onBack: () => void }> = ({ history, onBack }) => (
  <div className="space-y-4">
    <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1">&lt; BACK</button>
    <div className="font-bold underline">MEDICAL HISTORY</div>
    <div className="space-y-4">
      {history.map(item => (
        <div key={item.id} className="border-2 border-black p-3 space-y-2 bg-gray-50">
          <div className="flex justify-between font-bold text-xs">
            <span>{item.date}</span>
            <span>{item.doctorName}</span>
          </div>
          <div className="border-t border-black pt-1">
            <div className="text-[10px] font-bold">DIAGNOSIS:</div>
            <div className="text-xs italic">{item.diagnosis}</div>
          </div>
          <div>
            <div className="text-[10px] font-bold">NOTES:</div>
            <div className="text-xs">{item.notes}</div>
          </div>
        </div>
      ))}
    </div>
  </div>
);

const RemindersScreen: React.FC<{ onBack: () => void }> = ({ onBack }) => (
  <div className="space-y-4">
    <button onClick={onBack} className="text-xs border-2 border-black px-2 py-1">&lt; BACK</button>
    <div className="font-bold underline">REMINDER SETTINGS</div>
    
    <div className="space-y-6 pt-4">
      <div className="flex items-center justify-between border-2 border-black p-3">
        <span className="text-sm font-bold uppercase">ENABLE NOTIFICATIONS</span>
        <div className="w-10 h-6 border-2 border-black relative">
          <div className="absolute left-0 top-0 w-5 h-full bg-black"></div>
        </div>
      </div>

      <div className="border-2 border-black p-4 space-y-2">
        <div className="text-xs font-bold uppercase border-b border-black pb-1">EXAMPLE REMINDER</div>
        <div className="text-[10px] font-serif leading-tight">
          "MEDICITAS ALERT: You have an upcoming appointment with Dr. Smith tomorrow at 10:00 AM."
        </div>
      </div>

      <div className="space-y-2">
        <label className="text-xs font-bold">REMINDER TIME</label>
        <div className="flex gap-2">
          {['1 HR', '24 HRS', '48 HRS'].map(t => (
            <button key={t} className={`flex-1 border border-black p-1 text-[10px] ${t === '24 HRS' ? 'bg-black text-white' : ''}`}>
              {t} BEFORE
            </button>
          ))}
        </div>
      </div>
    </div>
  </div>
);

export default App;
