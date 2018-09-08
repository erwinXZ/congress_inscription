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

$pdf = new Pdf('Credenciales', 'R', array(210, 297));

$pdf->setAutoPageBreak(false);
$pdf->SetFillColor(255, 255, 255);

$pdf->AddPage();

$pdf->SetY(38);
$pdf->SetFont('dejavusans', 'B', 9);
$x = 5;
$y = 5;
$i = 0;
foreach ($participants as $participant) {
    $i++;
    switch ($participant->type) {
        case 'O':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-organizator.jpg', $x, $y, 65);
        break;
        case 'P':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-participant-professional.jpg', $x, $y, 65);
        break;
        case 'E':
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-expositor.jpg', $x, $y, 65);
        break;
        default:
            $pdf->Image(WWW_ROOT . 'img' . DS . 'credential-participant.jpg', $x, $y, 65);
    }

    $pdf->StartTransform();
    $name = strstr($participant->occupation, '.', true) ? strstr($participant->occupation, '.', true) . '. ' . $participant->name : $participant->name;
    if ($participant->type == 'P') {
        $pdf->SetFont('dejavusans', 'B', 13);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } elseif ($participant->type == 'O') {
        $pdf->SetFont('dejavusans', 'B', 13);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } elseif ($participant->type == 'E') {
        $pdf->SetFont('dejavusans', 'B', 13);
        $pdf->MultiCell(55, 28, strtoupper($name), 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    } 
    else {
        $pdf->SetFont('dejavusans', 'B', 13);
        $pdf->MultiCell(55, 28, $participant->name, 0, 'C', 0, 0, $x + 5, $y + 42, true, 0, false, true, 20, 'B');
    }
    $pdf->StopTransform();
    
    $x += 67.5;
    if ($i % 3 == 0) {
        $y += 96;
        $x = 5;
    }

}
$pdf->SetFont('dejavusans', 'BI', 9);

$pdf->Output('credenciales_' . '.pdf', 'I');
