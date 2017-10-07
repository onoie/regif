#ifndef MWINDOW_H
#define MWINDOW_H

#include <QMainWindow>

class MWindow : public QMainWindow{
    Q_OBJECT
public:
    MWindow(QWidget *parent = 0): QMainWindow(parent){}
    ~MWindow(){}
};

#endif // MWINDOW_H
