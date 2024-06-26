% rebase('layout.tpl', title='Prima algorithm theory', year=year)
<div class="container">
  <h1 class="text-center header-page">Алгоритм Прима</h1>

  <div class="theory-block">
    <h3>Формальная постановка задачи</h3>
    <p>
      Имеется неориентированный взвешенный граф. Назовем остовным
      деревом подграф, содержащий все вершины исходного графа, который является
      деревом. И задача состоит в том, чтобы найти такое остовное дерево, сумма
      рёбер которого минимальна.
    </p>
  </div>
  <div class="theory-block">
    <h3>Неформальная постановка задачи</h3>
    <p>
      Представьте исходный граф без рёбер, теперь вам нужно как-то соединить все
      вершины между собой, чтобы можно было бы попасть из любой вершины в
      другую, не имея при этом циклов в получившемся графе с минимально
      возможной суммой весов включенных рёбер.
    </p>
  </div>
  <div class="theory-block">
    <h3>Описание алгоритма</h3>
    <p>
      Суть самого алгоритма Прима сводится к жадному перебору рёбер, но из
      определенного множества. На входе имеется пустой подграф, который и будем
      достраивать до потенциального минимального остовного дерева.
    </p>
    <ul>
      <li>
        Изначально наш подграф состоит из одной любой вершины исходного графа.
      </li>
      <li>
        Затем из рёбер инцидентных этой вершине, выбирается такое минимальное
        ребро, которое связала бы две абсолютно разные компоненты связности,
        одной из которых и является наш подграф. То есть, как только у нас
        появляется возможность добавить новую вершину в наш подграф, мы тут же
        включаем ее по минимальмально возможному весу.
      </li>
      <li>
        Продолжаем выполнять предыдущий шаг до тех пор, пока не найдем искомое
        MST.
      </li>
    </ul>
  </div>

  <div class="theory-block">
    <h3>Псевдокод алгоритма Прима</h3>
    <p>Вход:</p>
    <ol>
      <li>Размерность матрицы n</li>
      <li>Матрица смежности cost[i][j]</li>
      <li>
        Связный взвешенный граф G = (V, E, c): заданный матрицей весов
        cost[i][j]
      </li>
    </ol>
    <p>Выход: вес min cost минимального остовного дерева графа G</p>
    <pre>
        <code id="pseudocode">1.    процедура AlgoPrima do  // Алгоритм Прима
            <br>2.    до тех пор пока(N < n) do  // N - номер текущей вершины
            <br>3.        пока(i=I; min=INF; i до n;) do  // Выбрать ребро из дерева в кайму с наименьшим весом
            <br>4.            пока(j=I; j до n;) do  // добавить конец ребра к дереву
            <br>5.                если(cost[i][j] до min) do  // изменить кайму: для чего
            <br>6.                    если(vis[i]!=0) do  // добавить в кайму вершины, соседние с новой
            <br>7.                        min=cost[i][j]; a=u=i; b=v=j;  // обновить список ребер из дерева в кайму так:
            <br>8.                        end;
            <br>9.                    если(vis[u]=0 || vis[v]=0) do
            <br>10.                       Вывести на экран "Ребро N:(ab) вес: min" (следующий элемент N);
            <br>11.                       mincost+=min;  // добавление веса ребра к весу дерева
            <br>12.                       vis[b]=I;
            <br>13.                   end;
            <br>14.                   cost[a][b]=cost[b][a]=999;  // чтобы он состоял из ребер наименьшего веса
            <br>15.           end;
            <br>16.       end;
            <br>17.    end;
            <br>18.    end.
        </code>
    </pre>
  </div>

  <div class="theory-block">
    <h3>Разбор конкретного примера</h3>
    <p>
        Применить алгоритм Прима для нахождения минимального остовного дерева следующего графа:
    </p>
    <figure class="text-center mb-3">
      <img src="/static/images/prima_and_kraskal_condition.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Исходный граф
      </figcaption>
    </figure>
    <p>
      Выбираем чисто случайно вершину <code>E</code>,далее рассмотрим все ребра
      исходящие из нее, включаем в наше остовное дерево ребро
      <code>C <--> E; w = 9</code>, так как данное ребро имеет минимальный вес
      из всех рёбер инцидентных множеству вершин нашего подграфа. Имеем
      следующее:
    </p>
    <figure class="text-center mb-3">
      <img src="/static/images/prima_step_1.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Подграф после добавления 1-го ребра
      </figcaption>
    </figure>
    <p>Теперь выборка производится из рёбер:</p>
    <code>
      D <--> C; w = 6
      <br />A <--> C; w = 8 <br />F <--> E; w = 10 <br />B <--> C; w = 11
      <br />D <--> E; w = 11
    </code>
    <p>
      То есть, в данный момент, мы знаем только о двух вершинах, соответственно,
      знаем о всех ребрах, исходящих из них. Про связи между другими вершинами,
      которые не включены в наш подграф, мы ничего не знаем, поэтому они на этом
      шаге не рассматриваются.
      <br /><br />Добавляем в наш подграф ребро D <--> C и по аналогии добаляем
      ребро D <--> B. Получаем следующее:
    </p>
    <figure class="text-center mb-3">
      <img src="/static/images/prima_step_2.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Подграф, полученный после добавления рассмотренных рёбер
      </figcaption>
    </figure>
    <p>
      Давайте добьем наш подграф до минимального остовного дерева. Вы, наверное,
      уже догадались о том, по каким ребрам мы будем связывать наши оставшиеся
      вершины: <code>A и F</code>.
    </p>

    <p>
      Проводим последние штрихи и получили тот же самый подграф в качестве
      минимального остовного дерева. Но как мы раннее говорили, сам подграф
      ничего не решает, главное тут - множество рёбер, которые включены в наше
      остовное дерево.
    </p>
    <figure class="text-center mb-3">
      <img src="/static/images/prima_and_kraskal_result.png" class="img-fluid" />
      <figcaption class="figure-caption">
        Искомое минимальное остовное дерево
      </figcaption>
    </figure>
    <p>Суммарный вес искомого MST равен 33.</p>
  </div>

  <div class="theory-block">
    <h3>Оценка сложности</h3>
    <p>
      Время работы алгоритма Прима зависит от способа хранения графа и выбора
      ребра с наименьшим весом. При использовании массива смежности и простого
      просмотра всех ребер сложность алгоритма составляет O(n^2), где n -
      количество вершин графа.
    </p>
    <p>
      При использовании списка смежности и двоичной кучи для хранения ребер
      сложность алгоритма снижается до O(m log n), где m - количество ребер
      графа.
    </p>
  </div>

  <div class="theory-block text-center">
    <h3>Попробуйте сами!</h3>
    <p>
      Если вы хотите протестировать алгоритм Прима на своем примере,
      воспользуйтесь нашим калькулятором:
    </p>
    <a href="/prima_algorithm_calc" class="btn btn-primary">Открыть калькулятор</a>
  </div>
</div>
