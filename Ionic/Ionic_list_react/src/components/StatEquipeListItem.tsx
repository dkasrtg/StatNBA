import React from 'react';
import { IonList, IonItem, IonLabel, IonBadge, IonCardContent, IonCard, IonGrid, IonRow, IonCol, IonIcon } from '@ionic/react';
import { StatEquipe } from '../models/StatEquipe';
import DataTable, { TableColumn } from 'react-data-table-component';
import { arrowUpCircle } from 'ionicons/icons';

interface StatEquipeListItemProps {
    StatEquipes: StatEquipe[];
}

const StatEquipeListItem: React.FC<StatEquipeListItemProps> = ({ StatEquipes }) => {
    const customStyles = {
        rows: {
            style: {
                minHeight: '72px', // override the row height
            },
        },
        headCells: {
            style: {
                paddingLeft: '8px', // override the cell padding for head cells
                paddingRight: '8px',
                backgroundColor: 'black',
                color: 'white',
            },
        },
        cells: {
            style: {
                paddingLeft: '8px', // override the cell padding for data cells
                paddingRight: '8px',
                backgroundColor: 'black',
                color: 'white',
            },
        },  
    };
    const columns: TableColumn<StatEquipe> = [
        { name:"Joueur", selector: (row: StatEquipe) => row.statJoueurStatic.nomJoueur        , sortable: true, right: true,},
        { name: "M"    , selector: (row: StatEquipe) => row.statJoueurStatic.nombreMatchEquipe        , sortable: true, right: true,},
        { name: "MJ"   , selector: (row: StatEquipe) => row.statJoueurStatic.nombreMatchJoueur       , sortable: true, right: true,},
        { name: "PPM"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[0]        , sortable: true, right: true,},
        { name: "RPM"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[1]        , sortable: true, right: true,},
        { name: "PDPM" , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[2]        , sortable: true, right: true,},
        { name: "MPM"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[3]        , sortable: true, right: true,},
        { name: "EFF"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[4]        , sortable: true, right: true,},
        { name: "FG%"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[5]           , sortable: true, right: true,},
        { name: "3P%"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[6]           , sortable: true, right: true,},
        { name: "%LF"  , selector: (row: StatEquipe) => row.statJoueurDynamic.typeActionValue[7]           , sortable: true, right: true,},




    ]
    return (
        <IonList className='johan-table'>
            <div className="App">
                <IonCard>
                    <DataTable
                    title=""
                    columns={columns}
                    data={StatEquipes}
                    defaultSortField="title"
                    sortIcon={<IonIcon aria-hidden="true" icon={arrowUpCircle} className='basket-icon'></IonIcon>}
                    pagination
                    selectableRows
                    customStyles={customStyles}
                    />
                </IonCard>
            </div>
        </IonList>
    );
};

export default StatEquipeListItem
