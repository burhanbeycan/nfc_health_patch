import Link from 'next/link';
import Header from '../components/Header';

const patients = [
  { id: 'p-001', name: 'Demo Patient', lastSync: '2 min ago', risk: 'Moderate', patch: 'PX-1042' },
  { id: 'p-002', name: 'Second Patient', lastSync: '19 min ago', risk: 'Low', patch: 'PX-1043' },
];

export default function HomePage() {
  return (
    <main className="container">
      <Header />
      <div className="card">
        <h2>Patient List</h2>
        <table className="table">
          <thead>
            <tr>
              <th>Name</th>
              <th>Patch</th>
              <th>Last Sync</th>
              <th>Risk</th>
            </tr>
          </thead>
          <tbody>
            {patients.map((patient) => (
              <tr key={patient.id}>
                <td>
                  <Link href={`/patient/${patient.id}`}>{patient.name}</Link>
                </td>
                <td>{patient.patch}</td>
                <td>{patient.lastSync}</td>
                <td>{patient.risk}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </main>
  );
}
