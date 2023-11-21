import { useState } from 'react';
import { getEquipe, getEquipeHost } from '../data/Equipe_data';
import { basketball } from 'ionicons/icons';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonNote,
  IonPage,
  IonThumbnail,
  IonTitle,
  IonToolbar,
  useIonViewWillEnter,
} from '@ionic/react';
import { personCircle } from 'ionicons/icons';
import { useParams } from 'react-router';
import './ViewEquipe.css';
import { Equipe } from '../models/Equipe';
import StatEquipeListItem from '../components/StatEquipeListItem';
import { StatEquipe } from '../models/StatEquipe';
import { getStatRelativeOneEquipe, getStatRelativeOneEquipeHost } from '../data/StatEquipe_data';

function ViewEquipe() {
  const [equipe, setEquipe] = useState<Equipe>();
  const [statRelatives, setStatRelatives] = useState<StatEquipe[]>([]);
  const params = useParams<{ id: string }>();

  useIonViewWillEnter( async () => {
    const equipe = await getEquipeHost(parseInt(params.id, 10));
    setEquipe(equipe);
    if (equipe){
      var ans = await getStatRelativeOneEquipeHost(equipe.id);
      setStatRelatives(ans);
    } 
  });

  return (
    <IonPage id="view-message-page">
      <IonHeader>
        <IonToolbar>
          <IonTitle style={{ textAlign: 'center' }}>
            <IonIcon aria-hidden="true" icon={basketball} className='basket-icon'></IonIcon>
            <span style={{ marginInline: '5%', }} className='johan-title'>Stat. Match</span>
            <IonIcon aria-hidden="true" icon={basketball} className='basket-icon'></IonIcon>
          </IonTitle>
        </IonToolbar>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton className='johan-label' text="Stat. Joueur" defaultHref="/home"></IonBackButton>
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      

      <IonContent fullscreen>
        {equipe ? (
          <>
            <IonItem>
              <IonThumbnail slot="start">
                <img alt="Silhouette of mountains" style={{borderRadius: '50%'}} src={"basket/"+equipe.image+".png"} />
              </IonThumbnail>
              <IonLabel className="ion-text-wrap">
                <h2 className='johan-label'>
                  {equipe.nom}
                  <span className="date">
                    <IonNote>{equipe.nom}</IonNote>
                  </span>
                </h2>
                <h3>
                  Details: <IonNote>...</IonNote>
                </h3>
              </IonLabel>
            </IonItem>

            <div className="ion-padding">
              <StatEquipeListItem StatEquipes={statRelatives} />
            </div>
          </>
        ) : (
          <div>Message not found</div>
        )}
      </IonContent>
    </IonPage>
  );
}

export default ViewEquipe;
