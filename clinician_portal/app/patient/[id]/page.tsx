interface PatientPageProps {
  params: { id: string };
}

export default function PatientDetailPage({ params }: PatientPageProps) {
  return (
    <main className="container">
      <div className="grid" style={{ gridTemplateColumns: '1.2fr 0.8fr' }}>
        <div className="card">
          <h1>Patient {params.id}</h1>
          <p>Patch PX-1042 • Last sync 2 min ago</p>
          <h2>Latest clinical summary</h2>
          <ul>
            <li>Heart rate: 72 bpm</li>
            <li>Respiration: 14/min</li>
            <li>Stress load: Moderate</li>
            <li>Glucose trend: Rising</li>
          </ul>
          <h2>ECG event review</h2>
          <div className="card" style={{ background: '#fafbff' }}>
            <p>Tachy candidate • confidence 0.78</p>
            <div style={{ height: 180, background: '#e9edf5', borderRadius: 12 }} />
          </div>
        </div>
        <div className="grid">
          <div className="card">
            <h2>Signal quality</h2>
            <p>ECG 93%</p>
            <p>Sweat 71%</p>
          </div>
          <div className="card">
            <h2>Top prediction drivers</h2>
            <ul>
              <li>Lower HRV than baseline</li>
              <li>Elevated EDA</li>
              <li>Mild skin temperature increase</li>
            </ul>
          </div>
          <div className="card">
            <h2>Next actions</h2>
            <ul>
              <li>Review latest ECG strip</li>
              <li>Confirm symptom journal entry</li>
              <li>Monitor glucose trend confidence</li>
            </ul>
          </div>
        </div>
      </div>
    </main>
  );
}
