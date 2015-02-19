#ifndef SURFACE_H_
#define SURFACE_H_

#include <QWidget>

class Surface : public QWidget
{
	Q_OBJECT

public:
	Surface(QWidget* parent = 0);
	virtual ~Surface();

	void setup();

protected:

};

#endif
