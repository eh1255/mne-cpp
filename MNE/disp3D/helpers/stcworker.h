#ifndef STCWORKER_H
#define STCWORKER_H


//*************************************************************************************************************
//=============================================================================================================
// INCLUDES
//=============================================================================================================

#include "../disp3D_global.h"


//*************************************************************************************************************
//=============================================================================================================
// QT INCLUDES
//=============================================================================================================

#include <QObject>
#include <QList>
#include <QThread>
#include <QSharedPointer>
#include <QMutex>


//*************************************************************************************************************
//=============================================================================================================
// Eigen INCLUDES
//=============================================================================================================

#include <Eigen/Core>



using namespace Eigen;


class DISP3DSHARED_EXPORT StcWorker : public QObject
{
    Q_OBJECT
public:
    typedef QSharedPointer<StcWorker> SPtr;            /**< Shared pointer type for StcWorker class. */
    typedef QSharedPointer<const StcWorker> ConstSPtr; /**< Const shared pointer type for StcWorker class. */

    StcWorker(QObject *parent = 0);

//    void setIntervall(int intervall);

    void addData(QList<VectorXd> &data);

    void process();

    void setInterval(int usec);

    void setLoop(bool looping);

signals:
    void stcSample(VectorXd sample);

private:

    QMutex m_qMutex;
    QList<VectorXd> m_data;   /**< List that holds the fiff matrix data <n_channels x n_samples> */
    bool m_bIsLooping;

    qint32 m_iCurrentSample;
    qint32 m_iUSecIntervall;
};

#endif // STCWORKER_H
