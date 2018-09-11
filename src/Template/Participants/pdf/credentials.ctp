<?php

use App\Utils\Pdf;

set_time_limit(3600);


$styleQR = array(
    'border' => 0,
    'vpadding' => 2,
    'hpadding' => 2,
    'fgcolor' => array(0, 0, 0),
    'bgcolor' => false,
    'module_width' => 1,
    'module_height' => 1
);

$pdf = new Pdf('Credenciales', 'P', array(216, 325));

$pdf->setAutoPageBreak(false);
$pdf->SetFillColor(255, 255, 255);

$pdf->AddPage();

$pdf->SetY(38);
$pdf->SetFont('roboto', 'B', 10);
$width = 216;
$height = 356;
$x = 3;
$y = 12;
$i = 0;
foreach ($participants as $participant) {
    $i++;
    switch ($participant->type) {
        case 'O':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-organizator2.png', $x, $y, 70);
        break;
        case 'P':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-participant2.png', $x, $y, 70);
        break;
        case 'E':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-expositor2.png', $x, $y, 70);
        break;
        default:
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-participant2.png', $x, $y, 70);
    }

    $pdf->StartTransform();
    $name = strstr($participant->occupation, '.', true) ? strstr($participant->occupation, '.', true) . '. ' . $participant->name : $participant->name;
    if ($participant->type == 'P' || $participant->type == 'S') {
        $pdf->SetFont('roboto', 'B', 14);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } elseif ($participant->type == 'O') {
        $pdf->SetFont('roboto', 'B', 14);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } elseif ($participant->type == 'E') {
        $pdf->SetFont('roboto', 'B', 14);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } 
    else {
        $pdf->SetFont('roboto', 'B', 14);
        $pdf->MultiCell(55, 28, $participant->name, 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    }
    $pdf->StopTransform();
    
    $x += 70;
    if ($i % 3 == 0) {
        $y += 100;
        $x = 3;
    }

}
$pdf->SetFont('roboto', 'BI', 9);

$pdf->Output('credenciales_' . '.pdf', 'I');
