#include "helper.h"
#include <QDebug>

Helper::Helper(QObject *parent) : QObject(parent)
{

}

QVector<int> transposing(QVector<int> &bricks);
QVector<int> swap_rows(QVector<int> &bricks);
QVector<int> swap_colums(QVector<int> &bricks);

QVector<int> Helper::newGame()
{
    QVector<int> bricks = {
        1, 3, 7, 2, 5, 9, 6, 4, 8,
        5, 8, 4, 3, 6, 1, 9, 7, 2,
        2, 9, 6, 8, 7, 4, 1, 5, 3,
        9, 7, 8, 1, 3, 6, 4, 2, 5,
        3, 6, 5, 7, 4, 2, 8, 1, 9,
        4, 1, 2, 9, 8, 5, 3, 6, 7,
        7, 5, 9, 4, 1, 8, 2, 3, 6,
        6, 2, 1, 5, 9, 3, 7, 8, 4,
        8, 4, 3, 6, 2, 7, 5, 9, 1,
    };
    int t = rand() % 2;
    if (t == 0)
        transposing(bricks);
    for (int n = 0; n < 20; n++)
    {
        int k = rand() % 2;
        if (k == 0)
            swap_rows(bricks);
        if (k == 1)
            swap_colums(bricks);
    }
    int n = 0;
    while (n != 40)
    {
        int r = rand() % 81;
        if (bricks[r] > 0)
        {
            bricks[r] = 0;
            n++;
        }
    }
    return  bricks;
}

QVector<int> transposing(QVector<int> &bricks)
{
    for (int i = 0; i < 9; i++) {
        for (int j = i + 1; j < 9; j++) {
            int t = bricks[9 * i + j];
            bricks[9 * i + j] = bricks[9 * j + i];
            bricks[9 * j + i] = t;
        }
    }
    return bricks;
}

QVector<int> swap_rows(QVector<int> &bricks)
{
    int f, r1, r2, r;
    r = rand() % 3;
    if (r == 0) {
        r1 = rand() % 3;
        if (r1 == 0)
            r2 = rand() % 2 + 1;
        if (r1 == 1) {
            f = rand() % 2;
            if (f == 0)
                r2 = 0;
            else r2 = 2;
        }
        if (r1 == 2)
            r2 = rand() % 2;
        for (int i = 0; i < 9; i++) {
            int t = bricks[9 * r1 + i];
            bricks[9 * r1 + i] = bricks[9 * r2 + i];
            bricks[9 * r2 + i] = t;
        }
    }
    if (r == 1) {
        r1 = rand() % 3 + 3;
        if (r1 == 3)
            r2 = rand() % 2 + 4;
        if (r1 == 4) {
            f = rand() % 2;
            if (f == 0)
                r2 = 3;
            else r2 = 5;
        }
        if (r1 == 5)
            r2 = rand() % 2 + 3;
        for (int i = 0; i < 9; i++) {
            int t = bricks[9 * r1 + i];
            bricks[9 * r1 + i] = bricks[9 * r2 + i];
            bricks[9 * r2 + i] = t;
        }
    }
    if (r == 2) {
        r1 = rand() % 3 + 6;
        if (r1 == 6)
            r2 = rand() % 2 + 7;
        if (r1 == 7) {
            f = rand() % 2;
            if (f == 0)
                r2 = 6;
            else r2 = 8;
        }
        if (r1 == 8)
            r2 = rand() % 2 + 6;
        for (int i = 0; i < 9; i++) {
            int t = bricks[9 * r1 + i];
            bricks[9 * r1 + i] = bricks[9 * r2 + i];
            bricks[9 * r2 + i] = t;
        }
    }
    return bricks;
}

QVector<int> swap_colums(QVector<int> &bricks)
{
    transposing(bricks);
    swap_rows(bricks);
    transposing(bricks);
    return bricks;
}

bool Helper::check(QVector<int> bricks)
{
    int i, j, c, k, ch = 0;
    int n[9];
    for (i = 0; i < 9; i++)
    {
        for (k = 0; k < 9; k++)
            n[k] = 0;
        for (j = 0; j < 9; j++)
        {
            c = bricks[9 * i + j];
            n[c-1]++;
        }
        for (k = 0; k < 9; k++)
            if (n[k] == 1)
                ch++;
    }
    if (ch != 81)
        return false;
    ch = 0;
    for (j = 0; j < 9; j++)
    {
        for (k = 0; k < 9; k++)
            n[k] = 0;
        for (i = 0; i < 9; i++)
        {
            c = bricks[9 * i + j];
            n[c-1]++;
        }
        for (k = 0; k < 9; k++)
            if (n[k] == 1)
                ch++;
    }
    if (ch != 81)
        return false;
    ch = 0;
    for (i = 0; i < 9; i += 3)
    {
        for (j = 0; j < 9; j += 3)
        {
            for (k = 0; k < 9; k++)
                n[k] = 0;
            for (int ik = i; ik < i+3; ik++)
                for (int jk = j; jk < j+3; jk++)
                {
                    c = bricks[9 * ik + jk];
                    n[c-1]++;
                }
            for (k = 0; k < 9; k++)
                if (n[k] == 1)
                    ch++;
        }
    }
    if (ch != 81)
        return false;
    return true;
}
