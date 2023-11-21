import EquipeListItem from '../components/EquipeListItem';
import { useState } from 'react';
import { getEquipes, getEquipesHost } from '../data/Equipe_data';
import {
  IonContent,
  IonHeader,
  IonIcon,
  IonList,
  IonPage,
  IonRefresher,
  IonRefresherContent,
  IonTitle,
  IonToolbar,
  useIonViewWillEnter
} from '@ionic/react';
import './Home.css';
import '../../public/assets/font.scss';
import { Equipe } from '../models/Equipe';
import { basketball } from 'ionicons/icons';

const Home: React.FC = () => {

  const [equipes, setEquipes] = useState<Equipe[]>([]);

  useIonViewWillEnter( async () => {
    const equipes = await getEquipesHost();
    setEquipes(equipes);
  });

  const refresh = (e: CustomEvent) => {
    setTimeout(() => {
      e.detail.complete();
    }, 3000);
  };

  return (
    <IonPage id="home-page">
      <IonHeader>
        <IonToolbar>
          <IonTitle style={{ textAlign: 'center' }}>
            <IonIcon aria-hidden="true" icon={basketball} className='basket-icon'></IonIcon>
            <span style={{ marginInline: '5%', }} className='johan-title'>Stat. Match</span>
            <IonIcon aria-hidden="true" icon={basketball} className='basket-icon'></IonIcon>
          </IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonRefresher slot="fixed" onIonRefresh={refresh}>
          <IonRefresherContent></IonRefresherContent>
        </IonRefresher>

        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">
              Stat. Match
            </IonTitle>
          </IonToolbar>
        </IonHeader>

        <IonList>
          {equipes.map(equipe => <EquipeListItem key={equipe.id} equipe={equipe} />)}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default Home;
