import {
  IonItem,
  IonLabel,
  IonNote,
  IonThumbnail
  } from '@ionic/react';
import './EquipeListItem.css';
import { Equipe } from '../models/Equipe';

interface EquipeListItemProps {
  equipe: Equipe;
}

const EquipeListItem: React.FC<EquipeListItemProps> = ({ equipe }) => {
  return (
    <IonItem routerLink={`/message/${equipe.id}`} detail={false}>
      <IonThumbnail slot="start">
        <img alt="Silhouette of mountains" style={{borderRadius: '50%'}} src={"basket/"+equipe.image+".png"} />
      </IonThumbnail>
      <IonLabel className="ion-text-wrap">
        <h2 className='johan-label'>
          {equipe.nom}
          <span className="date">
            <IonNote className='johan-link'>{equipe.nom} stat.</IonNote>
          </span>
        </h2>
      </IonLabel>
    </IonItem>
  );
};

export default EquipeListItem;
